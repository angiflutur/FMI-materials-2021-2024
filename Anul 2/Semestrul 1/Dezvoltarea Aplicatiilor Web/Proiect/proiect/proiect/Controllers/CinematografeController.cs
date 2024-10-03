using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proiect.Data;
using proiect.Models;
using System.Linq;
using System.Threading.Tasks;

namespace proiect.Controllers
{
    public class CinematografeController : Controller
    {
        private readonly AppDbContext _context;

        public CinematografeController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Cinematografe
        public async Task<IActionResult> Index()
        {
            var allCinematografe = await _context.Cinematografe.ToListAsync();
            return View(allCinematografe);
        }

        // GET: Cinematografe/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cinema = await _context.Cinematografe
                .FirstOrDefaultAsync(m => m.IdCinema == id);

            if (cinema == null)
            {
                return NotFound();
            }

            return View(cinema);
        }

        // GET: Cinematografe/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Cinematografe/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdCinema, NumeCinema, Descriere")] Cinema cinema)
        {
            if (ModelState.IsValid)
            {
                _context.Add(cinema);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(cinema);
        }

        // GET: Cinematografe/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cinema = await _context.Cinematografe.FindAsync(id);

            if (cinema == null)
            {
                return NotFound();
            }

            return View(cinema);
        }

        // POST: Cinematografe/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdCinema, NumeCinema, Descriere")] Cinema cinema)
        {
            if (id != cinema.IdCinema)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cinema);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CinemaExists(cinema.IdCinema))
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
            return View(cinema);
        }

        // GET: Cinematografe/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cinema = await _context.Cinematografe
                .FirstOrDefaultAsync(m => m.IdCinema == id);

            if (cinema == null)
            {
                return NotFound();
            }

            return View(cinema);
        }

        // POST: Cinematografe/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cinema = await _context.Cinematografe.FindAsync(id);
            _context.Cinematografe.Remove(cinema);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CinemaExists(int id)
        {
            return _context.Cinematografe.Any(e => e.IdCinema == id);
        }
    }
}
