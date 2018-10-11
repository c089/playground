<?php
namespace BirthdayGreetings;

class Notification {
    private $receipient;
    private $subject;
    private $message;

    private function __construct($receipient, $subject, $message) {
        $this->receipient = $receipient;
        $this->subject = $subject;
        $this->message = $message;
    }

    static function of ($receipient, $subject, $message) {
        return new Notification($receipient, $subject, $message);
    }
}
?>
