import javax.swing.*;
import java.awt.*;
import java.util.*;

public class Board extends JPanel implements ActionListener {
    
    private final int width = 1000;
    private final int height = 1000;

    private final Image unit;
    private final Image dot;

    //private ArrayList<Chain> snakes;

    private ArrayList<Tile> tiles;
    
    public Board () {
	addKeyListener(new TAdapter());
	setPreferredSize(width,height);

	for (int i=0;i<5;i++){
	    tiles.add(new Tile(i));
	}
	
	imgSetup();
	drawStart();

    }

    public void drawStart () {
	
    }

    public void paintComponent (Graphics g){
	super.paintComponent(g);
    }

    public void imgSetup() {	
	ImageIcon dotimg = new ImageIcon("dot.png");
	dot = dotimg.getImage();
	ImageIcon unitimg = new ImageIcon("unit.jpg");
	unit = unitimg.getImage();
    }


}
