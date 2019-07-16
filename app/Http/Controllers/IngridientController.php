<?php

namespace App\Http\Controllers;

use App\Ingridient;
use Illuminate\Http\Request;

class IngridientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ingridients = Ingridient::latest()->paginate(5);

        return view('ingridients.index',compact('ingridients'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('ingridients.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required'
        ]);

        Ingridient::create($request->all());

        return redirect()->route('ingridients.index')
            ->with('success','Ingridient created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Ingridient  $ingridient
     * @return \Illuminate\Http\Response
     */
    public function show(Ingridient $ingridient)
    {
        return view('ingridients.show',compact('ingridient'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Ingridient  $ingridient
     * @return \Illuminate\Http\Response
     */
    public function edit(Ingridient $ingridient)
    {
        return view('ingridients.edit',compact('ingridient'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Ingridient  $ingridient
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ingridient $ingridient)
    {
        $this->validate($request, [
            'name' => 'required'
        ]);;

        $ingridient->update($request->all());

        return redirect()->route('ingridients.index')
            ->with('success','Ingridient updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Ingridient  $ingridient
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ingridient $ingridient)
    {
        $ingridient->delete();

        return redirect()->route('ingridients.index')
            ->with('success','Ingridient deleted successfully');
    }
}
