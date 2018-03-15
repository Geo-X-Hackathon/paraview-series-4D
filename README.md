# paraview-series-4D
Visualize timeseries of 3D surface data with Paraview

## Input data
Output from the CAESAR model in txt file format.

## Workflow
1. Run the bash script
prepare_raw_data.sh /path/to/input-data /path/to/write/output-data
to make tif files with sortable file names and create differential DEM after every timestep.

2. Open paraview and activate its python console (View -> Python Shell)

3. Click the button 'Run Script' in the python shell and open
tiff_timeseries.py

4. At the prompt, enter the path to the Diff (folder containing differential DEM) directory within the output directory specified before.

5. Style the data in paraview:
- Use the filter 'Warp Scalar' for 3D projections.
- Activate View -> 'Color Map Editor' to optimize color display
- 'Rescale to custom range' to fit the actual data range
- Activating 'Use log scale when mapping data to colors' is very useful for displaying difference data
- 'Enable opacity mapping for surfaces'
- Choose Color Space 'Diverging' under Color Mapping Parameters


6. Activate 'View -> Animation View' to navigate through timeseries.
- Set mode to 'Real time' to visualize each step.
- Use the 'Play', 'Pause', 'Fast forward', etc., buttons for navigation.

