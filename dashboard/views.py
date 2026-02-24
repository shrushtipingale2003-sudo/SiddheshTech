from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.db.models import Sum, F, FloatField
from django.db.models.functions import TruncMonth
from django.db.models import ExpressionWrapper
from .models import Order, OrderItem, Product


def dashboard_view(request):
    # Total Orders
    total_orders = Order.objects.count()

    # Total Revenue
    total_revenue = (
        OrderItem.objects
        .annotate(
            total_price=ExpressionWrapper(
                F('quantity') * F('product__price'),
                output_field=FloatField()
            )
        )
        .aggregate(total=Sum('total_price'))['total'] or 0
    )

    # Total Products
    total_products = Product.objects.count()

    # Top Selling Products
    top_products = (
        OrderItem.objects
        .values('product__name')
        .annotate(total_sold=Sum('quantity'))
        .order_by('-total_sold')[:5]
    )

    # Monthly Revenue (FIXED VERSION)
    monthly_data = (
        OrderItem.objects
        .annotate(
            month=TruncMonth('order__created_at'),
            total_price=ExpressionWrapper(
                F('quantity') * F('product__price'),
                output_field=FloatField()
            )
        )
        .values('month')
        .annotate(revenue=Sum('total_price'))
        .order_by('month')
    )

    months = []
    revenues = []

    for data in monthly_data:
        if data['month'] is not None:
            months.append(data['month'].strftime('%b %Y'))
            revenues.append(float(data['revenue'] or 0))

    context = {
        'total_orders': total_orders,
        'total_revenue': total_revenue,
        'total_products': total_products,
        'top_products': top_products,
        'months': months,
        'revenues': revenues,
    }

    return render(request, 'dashboard/index.html', context)

# Category-wise Revenue
category_data = (
    OrderItem.objects
    .annotate(
        total_price=ExpressionWrapper(
            F('quantity') * F('product__price'),
            output_field=FloatField()
        )
    )
    .values('product__category__name')
    .annotate(revenue=Sum('total_price'))
)

categories = []
category_revenues = []

for data in category_data:
    categories.append(data['product__category__name'])
    category_revenues.append(float(data['revenue'] or 0))