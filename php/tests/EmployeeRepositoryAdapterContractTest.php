<?php

use PHPUnit\Framework\TestCase;
use BirthdayGreetings\Employee;

abstract class EmployeeRepositoryAdapterContractTest extends TestCase {
    abstract function createRepositoryFor($employees);

    public function testReturnsEmptyListWhenItIsNoOnesBirthday() {
        $repository = $this->createRepositoryFor([
            new Employee('Doe', 'John', (new DateTimeImmutable('1982/10/08')), 'john.doe@foobar.com'),
            new Employee('One', 'Some', (new DateTimeImmutable('1990/09/11')), 'one.some@foobar.com')
        ]);
        $employees = $repository->findEmployeesBornOn(1, 1);

        $this->assertCount(0, $employees);
    }

    public function testFindsSingleEmployeeBornOnADate() {
        $repository = $this->createRepositoryFor([
            new Employee('Doe', 'John', (new DateTimeImmutable('1982/10/08')), 'john.doe@foobar.com')
        ]);
        $employee = $repository->findEmployeesBornOn(10, 8)[0];

        $this->assertEquals(
            new Employee('Doe', 'John', new DateTimeImmutable('1982-10-08'), 'john.doe@foobar.com'),
            $employee
        );
    }

    public function testReturnsMultipleEmployeesWithABirthday() {
        $repository = $this->createRepositoryFor([
            new Employee('Doe', 'John', (new DateTimeImmutable('1982/01/05')), 'john.doe@foobar.com'),
            new Employee('One', 'Some', (new DateTimeImmutable('1990/01/05')), 'one.some@foobar.com')
        ]);

        $this->assertCount(2, $repository->findEmployeesBornOn(1, 5));
    }
}
?>
