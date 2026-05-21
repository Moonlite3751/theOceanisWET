using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ChickenAPI.Model
{
    public class FarmDbContext :DbContext
    {
        public DbSet<Chicken> Chicken { get; set; }

        public FarmDbContext(DbContextOptions<FarmDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Chicken>()
                .Property(c => c.ChickID)
                .HasPrecision(5, 2); //Set precision for decimal type, meaning 5 total digits and 2 decimal places
        }
    }
}