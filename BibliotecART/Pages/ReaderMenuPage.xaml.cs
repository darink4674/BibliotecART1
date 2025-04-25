using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class ReaderMenuPage : Page
    {
        private int _readerId;

        public ReaderMenuPage(int readerId)
        {
            InitializeComponent();
            _readerId = readerId;
        }

        private void MyBooks_Click(object sender, RoutedEventArgs e)
        {
            // Переходим на страницу с книгами и передаем readerId
            NavigationService.Navigate(new ReaderBooksPage(_readerId));
        }

        private void SearchBooks_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new SearchPage());
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderAuthPage());
        }
    }
}