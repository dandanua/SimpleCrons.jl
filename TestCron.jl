module TestCron
# export main
using SimpleCron, Dates, Base.Threads

function main()
    # c = Cron(Second(1), dynamic = true)
    c = Cron(Millisecond(1), dynamic = true)
#     c = Cron(Millisecond(1))
#     c = Cron(Microsecond(1))
#     @show c
    @spawn start(c)

    yo() = ()#println("yo")
    @spawn subscribe(c, yo)
#     stop(c)
#     @async start(c)
#     @show c
    sleep(1/100)
#     SimpleCron.sleep_until(now(UTC)+Millisecond(100))
    @show c.phase
    stop(c)
end

end
