# paraview-series-4D
Visualize timeseries of 3D surface data with Paraview

## Input data
Output from the CAESAR model in txt file format.

## Workflow
1. Run the bash script
prepare_raw_data.sh /path/to/input-data /path/to/write/output-data
to make tif files with sortable file names.

2. Open paraview and activate its python console (View -> Python Shell)

3. Click the button 'Run Script' in the python shell and open
tiff_timeseries.py

4. At the prompt, enter the path to the Diff directory within the output directory specified before.

5. Style the data ...



