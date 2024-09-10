using Microsoft.EntityFrameworkCore;
using TiendaRigo.Models;
using TiendaRigo.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

//PARA CORDS
builder.Services.AddCors( c =>
{
    c.AddPolicy("AllowOrigin", options => options.WithOrigins("http://localhost:4200/", "http://localhost:4200/*").
    AllowAnyHeader().WithExposedHeaders("Token", "Refreshtoken"));
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IProductoService, ProductoService>();


//EntityFramWork
builder.Services.AddDbContext<RigoContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("Rigo_conection"));
});

var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
    app.UseSwagger();
    app.UseSwaggerUI();
//}

// otro para cords
app.UseCors(options => options.WithOrigins("http://localhost:4200/", "http://localhost:4200/*").
    AllowAnyHeader().AllowAnyMethod().WithExposedHeaders("Token", "Refreshtoken"));

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
