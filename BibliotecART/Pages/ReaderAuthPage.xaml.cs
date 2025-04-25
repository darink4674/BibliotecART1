using BibliotecART.Connection;
using System.Linq;
using System;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class ReaderAuthPage : Page
    {
        public ReaderAuthPage()
        {
            InitializeComponent();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            string email = EmailBox.Text;
            string password = PasswordBox.Password;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ErrorText.Text = "Заполните все поля";
                return;
            }

            try
            {
                var reader = DB.BIB.Readers.FirstOrDefault(r => r.Email == email && r.Password == password);

                if (reader != null)
                {
                    // Переходим в меню читателя и передаем его ID
                    NavigationService.Navigate(new ReaderMenuPage(reader.ReaderID));
                }
                else
                {
                    ErrorText.Text = "Неверный email или пароль";
                }
            }
            catch (Exception ex)
            {
                ErrorText.Text = "Ошибка: " + ex.Message;
            }
        }

        private void Register_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderRegisterPage());
        }
        private void StaffLogin_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthPage());
        }
    }
}