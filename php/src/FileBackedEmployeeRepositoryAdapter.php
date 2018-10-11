<?php
namespace BirthdayGreetings;
use \DateTimeImmutable;

class FileBackedEmployeeRepositoryAdapter implements EmployeeRepositoryPort {
    private $employees;

    public function __construct($fileHandle) {
        $this->file = $fileHandle;
        $this->employees = [];

        $ignoredHeaderLine = fgets($this->file);
        while (($values = fgetcsv($this->file)) !== false) {
            $employee = $this->createEmployeeFromLineValues($values);

            array_push($this->employees, $employee);
        }
    }

    private function createEmployeeFromLineValues($values) {
        $birthDate = DateTimeImmutable::createFromFormat(
            'Y/m/d', trim($values[2]))->setTime(0,0,0,0);

        return new Employee(
            $values[0], trim($values[1]), $birthDate, trim($values[3]));
    }

    public function findEmployeesBornOn($month, $dayOfMonth) {
        $potentialBirthDate = new BirthDate($dayOfMonth, $month);
        return array_filter($this->employees, function ($employee) use ($potentialBirthDate) {
            return $potentialBirthDate == $employee->getBirthDate();
        });
    }
}
?>
