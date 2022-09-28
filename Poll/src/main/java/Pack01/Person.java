package Pack01;

// DTO
public class Person {
	String id;
	int pw;
	int salary;
	// 디폴트 생성자
	Person(){}
	Person(String id, int pw, int salary){
		this.id = id;
		this.pw = pw;
		this.salary = salary;
		System.out.println("생성자");
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
}
