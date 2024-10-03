using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proiect.Data;
using proiect.Models; // Asigurați-vă că aveți importat corect namespace-ul pentru modelul Actor

namespace proiect.Controllers
{
    public class ActoriController : Controller
    {
        private readonly AppDbContext _context;

        public ActoriController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Actori
        public IActionResult Index()
        {
            var data = _context.Actori.ToList();
            return View(data);
        }

        // GET: Actori/Details/5
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var actor = _context.Actori
                .FirstOrDefault(m => m.IdActor == id);
            if (actor == null)
            {
                return NotFound();
            }

            return View(actor);
        }

        // GET: Actori/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Actori/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("Id,Nume")] Actor actor)
        {
            if (ModelState.IsValid)
            {
                _context.Add(actor);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(actor);
        }

        // GET: Actori/Edit/5
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var actor = _context.Actori.Find(id);
            if (actor == null)
            {
                return NotFound();
            }
            return View(actor);
        }

        // POST: Actori/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("Id,Nume")] Actor actor)
        {
            if (id != actor.IdActor)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(actor);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ActorExists(actor.IdActor))
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
            return View(actor);
        }

        // GET: Actori/Delete/5
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var actor = _context.Actori
                .FirstOrDefault(m => m.IdActor == id);
            if (actor == null)
            {
                return NotFound();
            }

            return View(actor);
        }

        // POST: Actori/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var actor = _context.Actori.Find(id);
            if (actor == null)
            {
                return NotFound();
            }

            _context.Actori.Remove(actor);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        private bool ActorExists(int id)
        {
            return _context.Actori.Any(e => e.IdActor == id);
        }
    }
}
