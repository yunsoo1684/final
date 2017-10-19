package yong.bean;

public class scopeTest {
	private int count;
	
	public scopeTest() {
		System.out.println("ScopeTest()생성자 호출됨!");
		count = 0;
	}

	public int getCount() {
		System.out.println("현재 count의 값 : " + count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count + "값이 입력되어 " + this.count + "값이 누적됨!");
	}
}