//namespace Lab2_11
//{
//    public class NewtonsoftJsonPatchInput
//    {
//        public static NewtonsoftJsonPatchInputFormatter GetJsonPatchInputFormatter()
//        {
//            var builder = new ServiceCollection()
//                .AddLogging()
//                .AddMvc()
//                .AddNewtonsoftJson()
//                .Services.BuildServiceProvider();

//            return builder
//                .GetRequiredService<IOptions<MvcOptions>>()
//                .Value
//                .InputFormatters
//                .OfType<NewtonsoftJsonPatchInputFormatter>()
//                .First();
//        }
//    }
//}
