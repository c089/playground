<?php
use PHPUnit\Framework\TestCase;
use BirthdayGreetings\BirthDate;

class BirthDateTest extends TestCase {
    function testParsesMonthFromDatetime() {
        $this->assertEquals(5, BirthDate::of(new DateTimeImmutable('1986-05-12'))->getMonth());
    }

    function testParsesDayFromDatetime() {
        $this->assertEquals(12, BirthDate::of(new DateTimeImmutable('1986-05-12'))->getDayOfMonth());
    }
}
?>
