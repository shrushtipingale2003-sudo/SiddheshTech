import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class WordCounter extends JFrame implements ActionListener {

    JTextArea textArea;
    JButton countButton;
    JLabel resultLabel;

    public WordCounter() {

        // Frame Title
        setTitle("Word & Character Counter");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Text Area
        textArea = new JTextArea();
        JScrollPane scrollPane = new JScrollPane(textArea);

        // Button
        countButton = new JButton("Count Words & Characters");
        countButton.addActionListener(this);

        // Result Label
        resultLabel = new JLabel("Words: 0  Characters: 0");

        // Add components
        add(scrollPane, BorderLayout.CENTER);
        add(countButton, BorderLayout.SOUTH);
        add(resultLabel, BorderLayout.NORTH);

        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        String text = textArea.getText();

        // Count Characters
        int characters = text.length();

        // Count Words
        String trimmedText = text.trim();

        int words = 0;
        if (!trimmedText.isEmpty()) {
            words = trimmedText.split("\\s+").length;
        }

        resultLabel.setText("Words: " + words + "  Characters: " + characters);
    }

    public static void main(String[] args) {
        new WordCounter();
    }
}
