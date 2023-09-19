using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DAL.Migrations
{
    /// <inheritdoc />
    public partial class changedDeleteBehavior : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudentsInCourse_Students_StudentId",
                table: "StudentsInCourse");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentsInCourse_Students_StudentId",
                table: "StudentsInCourse",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudentsInCourse_Students_StudentId",
                table: "StudentsInCourse");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentsInCourse_Students_StudentId",
                table: "StudentsInCourse",
                column: "StudentId",
                principalTable: "Students",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
