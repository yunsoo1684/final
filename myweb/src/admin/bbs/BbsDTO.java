package admin.bbs;

public class BbsDTO {
   private int idx;
   public int getIdx() {
      return idx;
   }
   public void setIdx(int idx) {
      this.idx = idx;
   }
   private String code;
   private String name;
   private String price;
   private int s;
   private int m;
   private int l;
   private int xl;
   private int free;
   private String brand;
   private String type;
   private String picture;
   
   
   
   public BbsDTO() {
      super();
   }
   public BbsDTO(int idx,String code, String name, String price, int s, int m, int l, int xl, int free, String brand,
         String type, String picture) {
      super();
      this.idx = idx;
      this.code = code;
      this.name = name;
      this.price = price;
      this.s = s;
      this.m = m;
      this.l = l;
      this.xl = xl;
      this.free = free;
      this.brand = brand;
      this.type = type;
      this.picture = picture;
   }
   public String getCode() {
      return code;
   }
   public void setCode(String code) {
      this.code = code;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPrice() {
      return price;
   }
   public void setPrice(String price) {
      this.price = price;
   }
   public int getS() {
      return s;
   }
   public void setS(int s) {
      this.s = s;
   }
   public int getM() {
      return m;
   }
   public void setM(int m) {
      this.m = m;
   }
   public int getL() {
      return l;
   }
   public void setL(int l) {
      this.l = l;
   }
   public int getXl() {
      return xl;
   }
   public void setXl(int xl) {
      this.xl = xl;
   }
   public int getFree() {
      return free;
   }
   public void setFree(int free) {
      this.free = free;
   }
   public String getBrand() {
      return brand;
   }
   public void setBrand(String brand) {
      this.brand = brand;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getPicture() {
      return picture;
   }
   public void setPicture(String picture) {
      this.picture = picture;
   }
   

}