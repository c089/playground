<?php
use PHPUnit\Framework\TestCase;
use BirthdayGreetings\Notification;

class NotificationTest extends TestCase {
    public function testTwoObjectsAreEqual() {
        $n1 = Notification::of('x', 'y', 'z');
        $n2 = Notification::of('x', 'y', 'z');
        $this->assertEquals($n1, $n2);
    }

    public function testNotificationsAreNotEqualWithDifferentReceiver() {
        $receipient1 = 'person a';
        $receipient2 = 'not person a';
        $subject = 'subject';
        $message = 'message';
        $n1 = Notification::of($receipient1, $subject, $message);
        $n2 = Notification::of($receipient2, $subject, $message);
        $this->assertNotEquals($n1, $n2);
    }
}
?>
