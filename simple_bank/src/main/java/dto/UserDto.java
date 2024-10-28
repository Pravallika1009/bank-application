package dto;


public class UserDto 
{
	private String fname,lname,email,address,pass,gender;
	private Long phone;
	private int age;
	
	//default constructor;
	public UserDto(){}
	
	//constructor with two arguments	
	public UserDto(String email,String pass)
	{
		this.email=email;
		this.pass=pass;
	}
	// constructor with multiple arguments
	public UserDto(String fname, String lname, String email, String address, Long phone, String pass, int age,String gender) 
	{
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.pass = pass;
		this.age = age;
		this.gender=gender;
	}
	
	//Getters and setters
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserDto [fname=" + fname + ", lname=" + lname + ", email=" + email + ", address=" + address + ", pass="
				+ pass + ", phone=" + phone + ", age=" + age + "]";
	}
}
