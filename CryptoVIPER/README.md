#  VIPER

Açılımı View-Interactor-Presenter-Entity-Router Proje de main.storyboard u elle oluşturacağız bu yüzden siliyoruz ardından ViewController'ı da ve info da Storyboard Name property i de siliyoruz  

View içerisinde ViewController ımız, görünümümüz olacak yani kullanıcı ile etkileşime girdiğimiz şeyler burada olacak. View talks to -> Presenter ve class, protocol oluşturarak ilerleyeceğiz avantajı ise test yazma ve kullanmamız gereken bir fonksiyon olur ve unutursak önüne geçeceğiz ayrıca yapıları birbirinden düzenli bir şekilde ayırabilmemiz de protocol kullanımının avantajıdır. Ayrıca ViewController da ekleyeceğiz.

Interactor içinde yine class, protocol olacak ve talks to presenter, api verileri indirme işlemi burada olacak. (  "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"  )

Presenter yine class ve protocol içerecek talks to interactor, router, view 

Entity modelimiz struct oluşturacağız. 

Router buradaki önemli yerlerden biri bütün öğeleri barındırır ve koordine eder. Uygulama ilk açıldığında ilk hangi view gözükecek veya nereye gidecek gibi gibi sorular cevabını Router da bulur. İçerisinde yine protocol, class olacak ayrıca EntryPoint yani giriş noktasını da burada belirteceğiz  

Not: Garbage Collector(GC), bellekte uygulamanın kullandığı alanları 3 parçaya bölerek bunları kategorilendirir ve uygulama threadlerinin uygun olduğu durumlarda tüm threadleri durdurarak temizleme işlemi gerçekleştirilir.
