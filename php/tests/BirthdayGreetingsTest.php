<?php
use PHPUnit\Framework\TestCase;
use BirthdayGreetings\EmployeeRepositoryPort;
use BirthdayGreetings\NotificationPort;
use BirthdayGreetings\Notification;
use BirthdayGreetings\Application;
use BirthdayGreetings\Employee;
use BirthdayGreetings\FileBackedEmployeeRepositoryAdapter;

class FakeNotificationAdapter implements NotificationPort {
    public $receivedNotifications = [];

    public function notify($notification) {
        array_push($this->receivedNotifications, $notification);
    }
}

class BirthdayGreetingsTest extends TestCase {
    public function testSystem() {
        $notificationAdapter = new FakeNotificationAdapter();
        $employeeRepository = new FileBackedEmployeeRepositoryAdapter(fopen(__DIR__ . '/acceptance.input.txt', 'r'));
        $application = new Application($notificationAdapter, $employeeRepository);

        $application->sendTodaysBirthdayGreetings();

        $this->assertEquals(
            $notificationAdapter->receivedNotifications[0],
            Notification::of('John Doe <john.doe@foobar.com>', 'Happy Birthday!', 'Happy birthday, dear John!')
        );
    }

    public function testAcceptance() {
        $employees = [
            new Employee('Doe', 'John', (new DateTimeImmutable('1982/10/08')), 'john.doe@foobar.com'),
            new Employee('One', 'Some', (new DateTimeImmutable('1990/09/11')), 'one.some@foobar.com')
        ];
        $notificationAdapter = new FakeNotificationAdapter();
        $employeeRepository = new SimulatedEmployeesRepositoryAdapter($employees);
        $application = new Application($notificationAdapter, $employeeRepository);

        $application->sendTodaysBirthdayGreetings();

        $this->assertEquals(
            $notificationAdapter->receivedNotifications[0],
            Notification::of('John Doe <john.doe@foobar.com>', 'Happy Birthday!', 'Happy birthday, dear John!')
        );
    }
}
?>
