using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DAL.Migrations
{
    /// <inheritdoc />
    public partial class changedGradeToNullable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudentsInCourse_CoursesGrades_StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.DropIndex(
                name: "IX_StudentsInCourse_StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.AlterColumn<Guid>(
                name: "StudentCourseGradeId",
                table: "StudentsInCourse",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.CreateIndex(
                name: "IX_StudentsInCourse_StudentCourseGradeId",
                table: "StudentsInCourse",
                column: "StudentCourseGradeId",
                unique: true,
                filter: "[StudentCourseGradeId] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentsInCourse_CoursesGrades_StudentCourseGradeId",
                table: "StudentsInCourse",
                column: "StudentCourseGradeId",
                principalTable: "CoursesGrades",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudentsInCourse_CoursesGrades_StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.DropIndex(
                name: "IX_StudentsInCourse_StudentCourseGradeId",
                table: "StudentsInCourse");

            migrationBuilder.AlterColumn<Guid>(
                name: "StudentCourseGradeId",
                table: "StudentsInCourse",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_StudentsInCourse_StudentCourseGradeId",
                table: "StudentsInCourse",
                column: "StudentCourseGradeId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_StudentsInCourse_CoursesGrades_StudentCourseGradeId",
                table: "StudentsInCourse",
                column: "StudentCourseGradeId",
                principalTable: "CoursesGrades",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
