<?php
namespace BirthdayGreetings;
use \DateTimeInterface;

class BirthDate {
    private $dayOfMonth;
    private $month;

    function __construct($dayOfMonth, $month) {
        $this->dayOfMonth = $dayOfMonth;
        $this->month = $month;
    }

    public static function of(DateTimeInterface $datetime) {
        $day = intval($datetime->format('d'));
        $month = intval($datetime->format('m'));
        return new BirthDate($day, $month);
    }

    public function getMonth() {
        return $this->month;
    }

    public function getDayOfMonth() {
        return $this->dayOfMonth;
    }

}
?>
