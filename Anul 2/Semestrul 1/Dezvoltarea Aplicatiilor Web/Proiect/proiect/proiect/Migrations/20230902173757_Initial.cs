using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace proiect.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Actori",
                columns: table => new
                {
                    IdActor = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NumeActor = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Imagine = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Bio = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Actori", x => x.IdActor);
                });

            migrationBuilder.CreateTable(
                name: "Cinemas",
                columns: table => new
                {
                    IdCinema = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NumeCinema = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descriere = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cinemas", x => x.IdCinema);
                });

            migrationBuilder.CreateTable(
                name: "Producatori",
                columns: table => new
                {
                    IdProducator = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NumeProducator = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Imagine = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Bio = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Producatori", x => x.IdProducator);
                });

            migrationBuilder.CreateTable(
                name: "Filme",
                columns: table => new
                {
                    IdFilm = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Titlu = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Pret = table.Column<double>(type: "float", nullable: false),
                    Imagine = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CategorieFilm = table.Column<int>(type: "int", nullable: false),
                    IdCinema = table.Column<int>(type: "int", nullable: false),
                    IdProducator = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Filme", x => x.IdFilm);
                    table.ForeignKey(
                        name: "FK_Filme_Cinemas_IdCinema",
                        column: x => x.IdCinema,
                        principalTable: "Cinemas",
                        principalColumn: "IdCinema",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Filme_Producatori_IdProducator",
                        column: x => x.IdProducator,
                        principalTable: "Producatori",
                        principalColumn: "IdProducator",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Actori_Filme",
                columns: table => new
                {
                    IdFilm = table.Column<int>(type: "int", nullable: false),
                    IdActor = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Actori_Filme", x => new { x.IdActor, x.IdFilm });
                    table.ForeignKey(
                        name: "FK_Actori_Filme_Actori_IdActor",
                        column: x => x.IdActor,
                        principalTable: "Actori",
                        principalColumn: "IdActor",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Actori_Filme_Filme_IdFilm",
                        column: x => x.IdFilm,
                        principalTable: "Filme",
                        principalColumn: "IdFilm",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Actori_Filme_IdFilm",
                table: "Actori_Filme",
                column: "IdFilm");

            migrationBuilder.CreateIndex(
                name: "IX_Filme_IdCinema",
                table: "Filme",
                column: "IdCinema");

            migrationBuilder.CreateIndex(
                name: "IX_Filme_IdProducator",
                table: "Filme",
                column: "IdProducator");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Actori_Filme");

            migrationBuilder.DropTable(
                name: "Actori");

            migrationBuilder.DropTable(
                name: "Filme");

            migrationBuilder.DropTable(
                name: "Cinemas");

            migrationBuilder.DropTable(
                name: "Producatori");
        }
    }
}
