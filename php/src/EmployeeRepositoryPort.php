<?php
namespace BirthdayGreetings;

interface EmployeeRepositoryPort {
    public function findEmployeesBornOn($month, $dayOfMonth);
}

?>
