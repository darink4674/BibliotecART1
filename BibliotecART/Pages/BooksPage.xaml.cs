using BibliotecART.Connection;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class BooksPage : Page
    {
        private int _departmentId;

        public BooksPage(int departmentId)
        {
            InitializeComponent();
            _departmentId = departmentId;
            LoadBooks();
        }

        private void LoadBooks()
        {
            var department = DB.BIB.Departments.FirstOrDefault(d => d.DepartmentID == _departmentId);
            DepartmentTitle.Text = $"Книги отдела: {department?.Name}";

            BooksList.ItemsSource = DB.BIB.Books
                .Where(b => b.DepartmentID == _departmentId)
                .ToList();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}