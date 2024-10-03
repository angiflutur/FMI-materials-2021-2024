using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace proiect.Migrations
{
    /// <inheritdoc />
    public partial class corectareNumeCinema : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Filme_Cinemas_IdCinema",
                table: "Filme");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Cinemas",
                table: "Cinemas");

            migrationBuilder.RenameTable(
                name: "Cinemas",
                newName: "Cinematografe");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Cinematografe",
                table: "Cinematografe",
                column: "IdCinema");

            migrationBuilder.AddForeignKey(
                name: "FK_Filme_Cinematografe_IdCinema",
                table: "Filme",
                column: "IdCinema",
                principalTable: "Cinematografe",
                principalColumn: "IdCinema",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Filme_Cinematografe_IdCinema",
                table: "Filme");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Cinematografe",
                table: "Cinematografe");

            migrationBuilder.RenameTable(
                name: "Cinematografe",
                newName: "Cinemas");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Cinemas",
                table: "Cinemas",
                column: "IdCinema");

            migrationBuilder.AddForeignKey(
                name: "FK_Filme_Cinemas_IdCinema",
                table: "Filme",
                column: "IdCinema",
                principalTable: "Cinemas",
                principalColumn: "IdCinema",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
