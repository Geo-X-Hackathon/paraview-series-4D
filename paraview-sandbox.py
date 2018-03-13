cone = Cone()

print(cone.Resolution)

cone.Resolution = 32

ShrinkFilter = Shrink(cone)
ShrinkFilter.Input

ShrinkFilter.UpdatePipeline()

noCells = ShrinkFilter.GetDataInformation().GetNumberOfCells()
noPoints = ShrinkFilter.GetDataInformation().GetNumberOfPoints()

Show(ShrinkFilter)
Render()
