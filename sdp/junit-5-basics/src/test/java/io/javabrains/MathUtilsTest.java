// youtube video : https://www.youtube.com/watch?v=tTbBXf9Uh0s&list=PLqq-6Pq4lTTa4ad5JISViSb2FVG8Vwa4o&index=26 참고 
package io.javabrains;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.RepetitionInfo;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInfo;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestReporter;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;

// @TestInstance(TestInstance.Lifecycle.PER_CLASS) // per_method가 default 값

@DisplayName("When running MathUtils")
class MathUtilsTest {

	MathUtils mathutils; 
	TestInfo testInfo;
	TestReporter testReporter; 
//	@BeforeAll // void beforeAllIntit() 실행하면 오류 발생, 실행 인스턴스가 x  
//	void beforeAllIntit() { // static 이어야 함. 
//		System.out.println("This needs to run before all");
//	}
//	
	@BeforeEach // 코드의 중복 제거 
	void init(TestInfo testInfo, TestReporter testReporter ) { 
		this.testInfo = testInfo;
		this.testReporter = testReporter;
		mathutils = new MathUtils(); // 객체 생성 
	}
	
	@Nested // 그룹화 가능 (하나라도 실패할 경우 실패)
	@DisplayName("add method")
	@Tag("Math") // 메소드가 아닌 중첩된 클래스의 테스트에 태그를 달기 ! 
	class AddTest { 
		@Test
		@DisplayName("When adding two positive numbers")
		void testAddPositive() { 
			assertEquals(2, mathutils.add(1, 1), "should return the right sum"); 
		}
		
		@Test
		@DisplayName("When adding two negative numbers")
		void testAddNegative() { 
			int expected = -2;
			int actual = mathutils.add(-1, -1);
			assertEquals(expected, actual , () -> "should return sum" + expected + "but returncd" + actual); 
			// 비용이 많이 든다고 가정 (값이 비교되기도 전에 계산) -> 람다 사용 (테스트가 실패할 때만) => 간단하긴 하지만 모든 unit에서 사용 가능 ! 
		}
	}
	
//	@AfterEach
//	void cleanup() {
//		System.out.println("Cleaning up...");
//	}
//	
//	@Test
//	@DisplayName("Testing add method")
//	void testAdd() {
//		//fail("Not yet implemented");
//		//System.out.println("This test ran");
//		//systme.out.println(); huge코드에서 끔찍?!
//		//MathUtils mathutils = new MathUtils(); // 객체 생성 
//		int expected = 2;
//		assertEquals(expected, mathutils.add(1, 1), "The add method should add tow numbers"); 
//		//assertArrayEquals() , assertIterableEquals(), assertFalse() , assertNotEquals(), assertNull()
//	}
	
//	@Test
//	@Disabled  // 제거하여 실제 기능을 로컬에서 테스트 (반복하고 계속 변경하는데 도움이 됨)
//	@DisplayName("TDD method. Should not run")
//	void testDisabled() {
//		fail("This test should be disabled");
//	}
//	
	@Test
	@Tag("Math")
	@DisplayName("multiply method")
	void testMulti(){
		//System.out.println("Running " + testInfo.getDisplayName() + "with tags " + testInfo.getTags());
		testReporter.publishEntry("Running " + testInfo.getDisplayName() + "with tags " + testInfo.getTags());
		// 어떤클래스에서 실행되고 있으며 태그가 무엇인지 알고 있어야 함.
		// assertEquals(4, mathutils.multiply(2, 2), "should return the right product ");
		assertAll( // 람다 사용 
				() -> assertEquals(4, mathutils.multiply(2, 2)),
				() -> assertEquals(0, mathutils.multiply(2, 0)),
				() -> assertEquals(-2, mathutils.multiply(2, -1))
				);
	}
	
	@Test
	@Tag("Math")
	@DisplayName("Divide method")
	//@EnabledOnOs(OS.LINUX) // 리눅스 아니므로 비활성화 
	void testDivide() {
		//MathUtils mathutils = new MathUtils();
		boolean isServerup = false;
		assumeTrue(isServerup); // like 조건절 , 가정이 맞는 경우 실행 
		assertThrows(ArithmeticException.class , () -> mathutils.divide(1, 0), "divide by zero should throw ");
		//assertThrows(NullPointerException.class , () -> mathutils.divide(1, 0), "divide by zero should throw "); // 예외가 다르면 오류 발생 
		
	}
	
	@Test
	@Tag("Circle")
	//@RepeatedTest(3) // 3회 반복 
	//void testComputeCircleRadius(RepetitionInfo repetitionInfo)
	void testComputeCircleRadius() { // 반복 정보 객체 전달 
		// repetitionInfo.getCurrentRepetition(); // 현재 반복 회수  -> 반복에 따라 다른 일을 할 수 있도록 
		// repetitionInfo.getTotalRepetitions(); // 전제 반복 횟수 
		//MathUtils mathutils = new MathUtils();
		assertEquals(314.1592653589793, mathutils.computeCircleArea(10), "Should return right circle area");
	}

}
