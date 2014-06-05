public class Tile {
    
    //private int val;
    private boolean isHead;
    private Tile next;
    private Tile prev;
    
    //public Tile () {
    //val = 2;
    //}

    //public Tile (int n){
    //val = n;
    //}

    public Tile (Tile prev){
	this.prev = prev;
    }

    public void setNext(Tile next) {
	this.next = next;
    }

    public void setPrev(Tile prev) {
	this.prev = prev;
    }

    public void setHead(boolean isHead){
	this.isHead = isHead;
    }

    public boolean head() {
	return isHead;
    }

}
	
	
