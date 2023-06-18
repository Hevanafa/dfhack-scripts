local unit = df.global.world.units.active[0]

assert(unit, "Not in adventure mode!")

print(unit.job.current_job)

-- unit.job.current_job = df.job_type.Clean
