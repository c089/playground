<?php
use PHPUnit\Framework\TestCase;
use BirthdayGreetings\FileBackedEmployeeRepositoryAdapter;

class FileBackedEmployeeRepositoryAdapterTest extends EmployeeRepositoryAdapterContractTest {
    function createRepositoryFor($employees) {
        $tmpFile = $this->createTemporaryEmployeeFileFor($employees);
        return new FileBackedEmployeeRepositoryAdapter($tmpFile);
    }

    function createTemporaryEmployeeFileFor($employees) {
        $tmpFile = tmpfile();
        $content = 'last_name, first_name, date_of_birth, email' . "\n";
        fwrite($tmpFile, $content);

        foreach ($employees as &$employee) {
            $values = [
                $employee->getLastName(),
                $employee->getFirstName(),
                $employee->getBirthDay()->format('Y/m/d'),
                $employee->getEmailAddress()
            ];
            fputcsv($tmpFile, $values, ", ");
        }

        fseek($tmpFile, 0);
        return $tmpFile;
    }

}

?>
