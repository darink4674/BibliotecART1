using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media;

namespace BibliotecART.Converters
{
    public class OverdueConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null) return Brushes.Transparent;

            var status = value.ToString();
            if (status == "Просрочена")
                return new SolidColorBrush(Colors.LightPink);

            return Brushes.Transparent;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
