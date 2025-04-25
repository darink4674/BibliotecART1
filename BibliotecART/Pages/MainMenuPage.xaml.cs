using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class MainMenuPage : Page
    {
        public MainMenuPage()
        {
            InitializeComponent();
        }

        private void ViewByDepartments_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new DepartmentsPage());
        }

        private void SearchBooks_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new SearchPage());
        }

        private void IssueBooks_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new IssuePage());
        }
        private void ManageLoansButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ManageLoanPage());
        }
        private void ActiveLoansButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new ActiveLoansPage());
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
          
            NavigationService.Navigate(new AuthPage());
        }
    }
}