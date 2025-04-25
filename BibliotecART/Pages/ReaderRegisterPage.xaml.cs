using BibliotecART.Connection;
using System;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class ReaderRegisterPage : Page
    {
        public ReaderRegisterPage()
        {
            InitializeComponent();
        }

        private void Register_Click(object sender, RoutedEventArgs e)
        {
            if (PasswordBox.Password != ConfirmPasswordBox.Password)
            {
                MessageBox.Show("Пароли не совпадают");
                return;
            }

            try
            {
                var newReader = new Readers
                {
                    FirstName = FirstNameBox.Text,
                    LastName = LastNameBox.Text,
                    Phone = PhoneBox.Text,
                    Email = EmailBox.Text,
                    Address = AddressBox.Text,
                    Password = PasswordBox.Password
                };

                DB.BIB.Readers.Add(newReader);
                DB.BIB.SaveChanges();

                // Создаем библиотечную карту
                var card = new LibraryCards
                {
                    ReaderID = newReader.ReaderID,
                    IssueDate = DateTime.Today,
                    ExpiryDate = DateTime.Today.AddYears(1)
                };
                DB.BIB.LibraryCards.Add(card);
                DB.BIB.SaveChanges();

                MessageBox.Show("Регистрация успешна! Теперь вы можете войти.");
                NavigationService.Navigate(new ReaderAuthPage());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка регистрации: " + ex.Message);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderAuthPage());
        }
    }
}
