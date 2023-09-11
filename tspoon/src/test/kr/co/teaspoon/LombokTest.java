package kr.co.teaspoon;

import org.junit.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LombokTest {
    private static final Logger log = LoggerFactory.getLogger("kr.co.teaspoon.kr.co.teaspoon.test.kr.co.teaspoon.LombokTest.class");         // 현재 클래스의 이름 적어주기

    @BeforeClass
    public static final void testStart() {
        // 전체 클래스의 처음과 끝
        System.out.println("전체 테스트 시작");                                                    // 처음부터 System.out.println() 사용하면 에러 발생
    }

    @AfterClass
    public static final void testEnd() {
        // 전체 클래스의 처음과 끝
        System.out.println("전체 테스트 종료");
    }

    @Before
    public void testBeforePrint() {
        System.out.println("JUnit 테스트 시작");
    }

    @Test
    public void testLombok() {
        Sample dto = new Sample();
        dto.setNo(1);
        dto.setName("신예은");
        System.out.println(dto);
        log.info(dto.toString());
    }

    @Test
    public void testLombok2() {
        Sample dto = new Sample();
        dto.setNo(2);
        dto.setName("김이름");
        log.info(dto.toString());
    }

    @After
    public void testAfterPrint() {
        System.out.println("JUnit 테스트 종료");
    }
}
