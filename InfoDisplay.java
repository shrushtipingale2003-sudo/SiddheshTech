import java.awt.*;
import java.awt.event.*;

public class InfoDisplay extends Frame implements ActionListener {

    Button buttonA, buttonB;
    TextArea textArea;
    Panel topPanel;

    public InfoDisplay() {

        setTitle("Information Display");
        setSize(500, 300);
        setLayout(new BorderLayout());

        // Panel for buttons (First line)
        topPanel = new Panel();
        topPanel.setLayout(new FlowLayout());

        buttonA = new Button("A");
        buttonB = new Button("B");

        topPanel.add(buttonA);
        topPanel.add(buttonB);

        // TextArea for displaying info
        textArea = new TextArea();
        textArea.setEditable(false);

        // Add components
        add(topPanel, BorderLayout.NORTH);   // Buttons on top
        add(textArea, BorderLayout.CENTER);  // Text below

        buttonA.addActionListener(this);
        buttonB.addActionListener(this);

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                dispose();
            }
        });

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == buttonA) {
            textArea.setText(
                "Name: Shrushti\n" +
                "Course: MCS\n" +
                "Roll No: 1272240082\n" +
                "College: MIT World Peace University"
            );
        }

        if (e.getSource() == buttonB) {
            textArea.setText("Previous Semester CGPA: 8.5");
        }
    }

    public static void main(String[] args) {
        new InfoDisplay();
    }
}
