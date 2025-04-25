using BibliotecART.Connection;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class ReaderBooksPage : Page
    {
        private int _readerId;

        public ReaderBooksPage(int readerId)
        {
            InitializeComponent();
            _readerId = readerId;
            LoadBooks();
        }

        private void LoadBooks()
        {
            try
            {
                var readerBooks = DB.BIB.BookLoans
                    .Where(loan => loan.LibraryCards.ReaderID == _readerId &&
                                 loan.Status != "Возвращена")
                    .Select(loan => new
                    {
                        BookTitle = loan.Books.Title,
                        Author = loan.Books.Author,
                        LoanDate = loan.LoanDate,
                        ReturnDate = loan.ReturnDate,
                        loan.Status
                    })
                    .ToList();

                BooksList.ItemsSource = readerBooks;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка загрузки данных: " + ex.Message);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
