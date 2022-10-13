$outerArr = @("o1", "o2", "o3", "o4", "o5")
$innerArr = @("i1", "i2", "i3", "i4", "i5")

# Normal Double For loop --> 25 seconds
# Measure-Command {
#     foreach ($outer in $outerArr) {
#         foreach ($inner in $innerArr) {
#             sleep(1)
#         }
#     }
# }

# Multithreading --> Takes slightly more than 1 second
Measure-Command{
    $outerArr | ForEach-Object -Parallel {
        $outer = $_
        $innerArr | ForEach-Object -Parallel {
            $outer=$using:outer
            sleep(1)
        }
    }
} 