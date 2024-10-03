using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proiect.Data;
using proiect.Models;
using System.Threading.Tasks;
using System.Linq;

namespace proiect.Controllers
{
    public class FilmeController : Controller
    {
        private readonly AppDbContext _context;

        public FilmeController(AppDbContext context)
        {
            _context = context;
        }

        // Acțiune pentru a afișa toate filmele
        public async Task<IActionResult> Index()
        {
            var allFilme = await _context.Filme.ToListAsync();
            return View(allFilme);
        }

        // Acțiune pentru a afișa detaliile unui film
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var film = await _context.Filme
                .Include(f => f.Cinema)
                .Include(f => f.Producator)
                .Include(f => f.Actori_Filme)
                .FirstOrDefaultAsync(m => m.IdFilm == id);

            if (film == null)
            {
                return NotFound();
            }

            return View(film);
        }

        // Acțiune pentru a crea un nou film
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdFilm,Titlu,Pret,Descriere,Imagine,CategorieFilm,IdCinema,IdProducator")] Film film)
        {
            if (ModelState.IsValid)
            {
                _context.Add(film);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(film);
        }

        // Acțiune pentru a edita un film existent
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var film = await _context.Filme.FindAsync(id);
            if (film == null)
            {
                return NotFound();
            }
            return View(film);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdFilm,Titlu,Pret,Descriere,Imagine,CategorieFilm,IdCinema,IdProducator")] Film film)
        {
            if (id != film.IdFilm)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(film);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!FilmExists(film.IdFilm))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(film);
        }

        // Acțiune pentru a șterge un film
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var film = await _context.Filme
                .FirstOrDefaultAsync(m => m.IdFilm == id);
            if (film == null)
            {
                return NotFound();
            }

            return View(film);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var film = await _context.Filme.FindAsync(id);
            _context.Filme.Remove(film);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool FilmExists(int id)
        {
            return _context.Filme.Any(e => e.IdFilm == id);
        }
    }
}
