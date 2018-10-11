<?php
namespace BirthdayGreetings;

class Application {
    public function __construct(
        NotificationPort $notificationAdapter,
        EmployeeRepositoryPort $employeeRepository
    ) {
        $this->notificationAdapter = $notificationAdapter;
        $this->employeeRepository = $employeeRepository;
    }

    public function sendTodaysBirthdayGreetings() {
        $employee = $this->employeeRepository->findEmployeesBornOn(10, 8)[0];
        $firstName = $employee->getFirstName();
        $lastName = $employee->getLastName();
        $emailAddress = $employee->getEmailAddress();

        $notification = Notification::of(
            "{$firstName} {$lastName} <{$emailAddress}>",
            'Happy Birthday!',
            "Happy birthday, dear {$firstName}!");

        $this->notificationAdapter->notify($notification);
    }
}
?>
