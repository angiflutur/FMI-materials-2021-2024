using Lab2_11;

var AllowFrontendOrigin = "_AllowFrontendOrigin";

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: AllowFrontendOrigin,
                      policy =>
                      {
                          policy.WithOrigins("http://localhost:4200").AllowAnyMethod().AllowAnyHeader();
                      });
});
// Add services to the container.

builder.Services.AddControllers().AddNewtonsoftJson();
//    (options =>
//{
//    options.InputFormatters.Insert(0, NewtonsoftJsonPatchInput.GetJsonPatchInputFormatter());
//});
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

   //app.UseCors(x => x
   //         .AllowAnyOrigin()
   //         .AllowAnyMethod()
   //         .AllowAnyHeader());
app.UseCors(AllowFrontendOrigin);
app.UseAuthorization();

app.MapControllers();

app.Run();
