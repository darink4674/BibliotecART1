//using BibliotecART.Connection;
//using System;
//using System.Linq;
//using System.Windows;
//using System.Windows.Controls;

//namespace BibliotecART.Pages
//{
//    public partial class ManageLoanPage : Page
//    {
//        public ManageLoanPage()
//        {
//            InitializeComponent();
//            LoadReaders();
//        }

//        private void LoadReaders()
//        {
//            // Загружаем читателей с их картами
//            ReadersCombo.ItemsSource = DB.BIB.Readers
//                .ToList()
//                .Where(r => DB.BIB.LibraryCards.Any(c => c.ReaderID == r.ReaderID))
//                .ToList();
//        }

//        private void ReadersCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)
//        {
//            if (ReadersCombo.SelectedItem is Connection.Readers reader)
//            {
//                // Находим карту читателя
//                var card = DB.BIB.LibraryCards.FirstOrDefault(c => c.ReaderID == reader.ReaderID);
//                if (card == null) return;

//                // Получаем все выдачи для этой карты
//                var loans = DB.BIB.BookLoans
//                    .Where(bl => bl.CardID == card.CardID && (bl.Status == "На руках" || bl.Status == "Просрочена"))
//                    .ToList();

//                // Создаем простой список для отображения
//                var displayList = loans.Select(loan => new
//                {
//                    BookTitle = DB.BIB.Books.FirstOrDefault(b => b.BookID == loan.BookID)?.Title ?? "Неизвестная книга",
//                    LoanDate = loan.LoanDate,
//                    Status = loan.Status,
//                    LoanId = loan.LoanID
//                }).ToList();

//                LoansList.ItemsSource = displayList;
//            }
//        }

//        private void ReturnBook_Click(object sender, RoutedEventArgs e)
//        {
//            var selectedItem = LoansList.SelectedItem;
//            if (selectedItem == null)
//            {
//                MessageBox.Show("Выберите книгу!");
//                return;
//            }

//            // Получаем LoanID через reflection (простой способ)
//            var loanId = (int)selectedItem.GetType().GetProperty("LoanId").GetValue(selectedItem);

//            var loan = DB.BIB.BookLoans.FirstOrDefault(bl => bl.LoanID == loanId);
//            if (loan == null) return;

//            loan.Status = "Возвращена";
//            loan.ReturnDate = DateTime.Today;

//            var book = DB.BIB.Books.FirstOrDefault(b => b.BookID == loan.BookID);
//            if (book != null) book.Available = true;

//            DB.BIB.SaveChanges();
//            MessageBox.Show("Книга возвращена!");
//            ReadersCombo_SelectionChanged(null, null);
//        }

//        private void ExtendLoan_Click(object sender, RoutedEventArgs e)
//        {
//            var selectedItem = LoansList.SelectedItem;
//            if (selectedItem == null)
//            {
//                MessageBox.Show("Выберите книгу!");
//                return;
//            }

//            var loanId = (int)selectedItem.GetType().GetProperty("LoanId").GetValue(selectedItem);
//            var loan = DB.BIB.BookLoans.FirstOrDefault(bl => bl.LoanID == loanId);
//            if (loan == null) return;

//            loan.ReturnDate = (loan.ReturnDate ?? DateTime.Today).AddDays(14);
//            loan.Status = "На руках";

//            DB.BIB.SaveChanges();
//            MessageBox.Show("Срок продлен на 14 дней!");
//            ReadersCombo_SelectionChanged(null, null);
//        }

//        private void Back_Click(object sender, RoutedEventArgs e)
//        {
//            NavigationService.GoBack();
//        }
//    }
//}
using BibliotecART.Connection;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BibliotecART.Pages
{
    public partial class ManageLoanPage : Page
    {
        public ManageLoanPage()
        {
            InitializeComponent();
            LoadReaders();
        }

        private void LoadReaders()
        {
            ReadersCombo.ItemsSource = DB.BIB.Readers
                .ToList()
                .Where(r => DB.BIB.LibraryCards.Any(c => c.ReaderID == r.ReaderID))
                .ToList();
        }

        private void ReadersCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ReadersCombo.SelectedItem is Readers reader)
            {
                var card = DB.BIB.LibraryCards.FirstOrDefault(c => c.ReaderID == reader.ReaderID);
                if (card == null) return;

                var loans = DB.BIB.BookLoans
                    .Where(bl => bl.CardID == card.CardID && (bl.Status == "На руках" || bl.Status == "Просрочена"))
                    .ToList();

                var displayList = loans.Select(loan => new
                {
                    BookTitle = DB.BIB.Books.FirstOrDefault(b => b.BookID == loan.BookID)?.Title ?? "Неизвестная книга",
                    LoanDate = loan.LoanDate,
                    ReturnDate = loan.ReturnDate, // Добавлено отображение даты возврата
                    Status = loan.Status,
                    LoanId = loan.LoanID
                }).ToList();

                LoansList.ItemsSource = displayList;
            }
        }

        private void ReturnBook_Click(object sender, RoutedEventArgs e)
        {
            var selectedItem = LoansList.SelectedItem;
            if (selectedItem == null)
            {
                MessageBox.Show("Выберите книгу!");
                return;
            }

            var loanId = (int)selectedItem.GetType().GetProperty("LoanId").GetValue(selectedItem);
            var loan = DB.BIB.BookLoans.FirstOrDefault(bl => bl.LoanID == loanId);
            if (loan == null) return;

            loan.Status = "Возвращена";
            loan.ReturnDate = DateTime.Today;

            var book = DB.BIB.Books.FirstOrDefault(b => b.BookID == loan.BookID);
            if (book != null) book.Available = true;

            DB.BIB.SaveChanges();
            MessageBox.Show("Книга возвращена!");
            ReadersCombo_SelectionChanged(null, null);
        }

        private void ExtendLoan_Click(object sender, RoutedEventArgs e)
        {
            var selectedItem = LoansList.SelectedItem;
            if (selectedItem == null)
            {
                MessageBox.Show("Выберите книгу!");
                return;
            }

            var loanId = (int)selectedItem.GetType().GetProperty("LoanId").GetValue(selectedItem);
            var loan = DB.BIB.BookLoans.FirstOrDefault(bl => bl.LoanID == loanId);
            if (loan == null) return;

            loan.ReturnDate = (loan.ReturnDate ?? DateTime.Today).AddDays(14);
            loan.Status = "На руках";

            DB.BIB.SaveChanges();
            MessageBox.Show("Срок продлен на 14 дней!");
            ReadersCombo_SelectionChanged(null, null);
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}