using BibliotecART.Connection;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class DepartmentsPage : Page
    {
        public DepartmentsPage()
        {
            InitializeComponent();
            LoadDepartments();
        }

        private void LoadDepartments()
        {
            DepartmentsList.ItemsSource = DB.BIB.Departments.ToList();
        }

        private void ShowBooks_Click(object sender, RoutedEventArgs e)
        {
            if (DepartmentsList.SelectedItem is Departments selectedDepartment)
            {
                NavigationService.Navigate(new BooksPage(selectedDepartment.DepartmentID));
            }
            else
            {
                MessageBox.Show("Выберите отдел");
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}