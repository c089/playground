<?php
use BirthdayGreetings\EmployeeRepositoryPort;
use BirthdayGreetings\Birthdate;

class SimulatedEmployeesRepositoryAdapter implements EmployeeRepositoryPort {
    private $employees;

    function __construct($employees) {
        $this->employees = $employees;
    }

    function findEmployeesBornOn($month, $dayOfMonth) {
        $potentialBirthDate = new BirthDate($dayOfMonth, $month);
        return array_filter($this->employees, function ($employee) use ($potentialBirthDate) {
            return $potentialBirthDate == $employee->getBirthDate();
        });
    }
}

class SimulatedEmployeeRepositoryAdapterTest extends EmployeeRepositoryAdapterContractTest {
    function createRepositoryFor($employees) {
        return new SimulatedEmployeesRepositoryAdapter($employees);
    }
}
?>
