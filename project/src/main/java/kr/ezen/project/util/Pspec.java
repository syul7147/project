package kr.ezen.project.util;


public enum Pspec {
	New("NewArrivals"),Best("Best30");
	
	
	private final String value;
	
	private Pspec(String value) {
		this.value = value;
	}
	public String getValue() {
		return value;
	}
}

