
using BibliotecART.Connection;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class IssuePage : Page
    {
        public IssuePage()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            ReadersCombo.ItemsSource = DB.BIB.Readers.ToList();
            BooksCombo.ItemsSource = DB.BIB.Books.Where(b => b.Available == true).ToList();
            ReturnDate.SelectedDate = DateTime.Today.AddDays(14);
        }

        private void IssueBook_Click(object sender, RoutedEventArgs e)
        {
            if (ReadersCombo.SelectedItem == null || BooksCombo.SelectedItem == null || ReturnDate.SelectedDate == null)
            {
                MessageBox.Show("Заполните все поля");
                return;
            }

            var reader = (Connection.Readers)ReadersCombo.SelectedItem;
            var book = (Connection.Books)BooksCombo.SelectedItem;
            var returnDate = ReturnDate.SelectedDate.Value;

            var card = DB.BIB.LibraryCards.FirstOrDefault(c => c.ReaderID == reader.ReaderID);
            if (card == null)
            {
                MessageBox.Show("У читателя нет библиотечной карты");
                return;
            }

           var loan = new Connection.BookLoans
            {
                BookID = book.BookID,
                CardID = card.CardID,
                EmployeeID = 1,
                LoanDate = DateTime.Today,
                ReturnDate = returnDate,
                Status = "На руках"
            };

            book.Available = false;

            try
            {
                DB.BIB.BookLoans.Add(loan);
                DB.BIB.SaveChanges();
                MessageBox.Show("Книга успешно выдана");
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}