using BibliotecART.Connection;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }
        private void ReaderLogin_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderAuthPage());
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            var login = LoginBox.Text;
            var password = PasswordBox.Password;

            var employee = DB.BIB.Employees.FirstOrDefault(emp =>
                           emp.FirstName == login && emp.Password == password);

            if (employee != null)
            {
                NavigationService.Navigate(new MainMenuPage());
            }
            else
            {
                ErrorText.Text = "Неверный логин или пароль";




            }

        }
    }
}