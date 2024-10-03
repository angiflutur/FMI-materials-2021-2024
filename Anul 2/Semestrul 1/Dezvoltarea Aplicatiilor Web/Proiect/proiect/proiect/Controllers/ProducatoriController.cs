using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proiect.Data;
using proiect.Models;
using System.Linq;
using System.Threading.Tasks;

namespace proiect.Controllers
{
    public class ProducatoriController : Controller
    {
        private readonly AppDbContext _context;

        public ProducatoriController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Producatori
        public async Task<IActionResult> Index()
        {
            var allProducatori = await _context.Producatori.ToListAsync();
            return View(allProducatori);
        }

        // GET: Producatori/Details/5
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producator = _context.Producatori.FirstOrDefault(m => m.IdProducator == id);
            if (producator == null)
            {
                return NotFound();
            }

            return View(producator);
        }

        // GET: Producatori/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Producatori/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("IdProducator,NumeProducator,Imagine,Bio")] Producator producator)
        {
            if (ModelState.IsValid)
            {
                _context.Add(producator);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(producator);
        }

        // GET: Producatori/Edit/5
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producator = _context.Producatori.Find(id);
            if (producator == null)
            {
                return NotFound();
            }
            return View(producator);
        }

        // POST: Producatori/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("IdProducator,NumeProducator,Imagine,Bio")] Producator producator)
        {
            if (id != producator.IdProducator)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(producator);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProducatorExists(producator.IdProducator))
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
            return View(producator);
        }

        // GET: Producatori/Delete/5
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producator = _context.Producatori.FirstOrDefault(m => m.IdProducator == id);
            if (producator == null)
            {
                return NotFound();
            }

            return View(producator);
        }

        // POST: Producatori/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var producator = _context.Producatori.Find(id);
            if (producator == null)
            {
                return NotFound();
            }

            _context.Producatori.Remove(producator);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        private bool ProducatorExists(int id)
        {
            return _context.Producatori.Any(e => e.IdProducator == id);
        }
    }
}
