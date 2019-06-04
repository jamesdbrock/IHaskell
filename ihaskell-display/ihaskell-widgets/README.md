# IHaskell-Widgets

This package implements the [ipython widgets](https://github.com/ipython/ipywidgets) in
IHaskell. The frontend (javascript) is provided by the jupyter/ipython notebook environment, whereas
the backend is implemented in haskell.

To know more about the widget messaging protocol, see [MsgSpec.md](MsgSpec.md).

# Installation and Development

* Make sure ad blockers are disabled. Ad blockers will interfere with the
  Jupyter client-server comms. Check the browser Javascript console.

* Enable the `widgetsnbextension`.

  * ```bash
    jupyter nbextension enable --py widgetsnbextension
    ```

  * With Stack+Docker:
    ```bash
    stack --docker exec jupyter -- nbextension enable --py widgetsnbextension
    ```

* Run `jupyter` from the root IHaskell directory and open the `Examples`
  directory.

  * ```bash
    jupyter -- notebook --NotebookApp.token='' ihaskell-display/ihaskell-widgets/Examples/
    ```

  * With Stack+Docker:
    ```bash
    stack --docker exec jupyter -- notebook --NotebookApp.token='' ihaskell-display/ihaskell-widgets/Examples/
    ```

