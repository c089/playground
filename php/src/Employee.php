<?php
namespace BirthdayGreetings;
use \DateTimeInterface;

class Employee {
    public function __construct($lastName, $firstName, DateTimeInterface $birthDate, $emailAddress) {
        $this->lastName = $lastName;
        $this->firstName = $firstName;
        $this->birthday = $birthDate;
        $this->birthDate = BirthDate::of($birthDate);
        $this->emailAddress = $emailAddress;
    }

    public function getFirstName() {
        return $this->firstName;
    }

    public function getLastName() {
        return $this->lastName;
    }

    public function getEmailAddress() {
        return $this->emailAddress;
    }

    public function getBirthDay() {
        return $this->birthday;
    }

    public function getBirthDate() {
        return $this->birthDate;
    }

}

?>
