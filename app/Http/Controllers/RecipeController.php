<?php

namespace App\Http\Controllers;

use App\Ingridient;
use App\Recipe;
use App\RecipeIngrigient;
use Illuminate\Http\Request;

class RecipeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $recipes = Recipe::latest()->paginate(5);

        return view('recipes.index',compact('recipes'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $ingridient = Ingridient::all();
        return view('recipes.create',compact('ingridient'));
    }

    /**
     * Store a newly created resource in storage.
     * @param  \App\RecipeIngrigient  $item
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'description' => 'required'
        ]);

        $recipe = Recipe::create($request->all());
        foreach ($request['ingridient'] as $ingridient){
            $item = new RecipeIngrigient();
            $item->recipe_id = $recipe->id;
            $item->ingridient_id = $ingridient['ingridient_id'];
            $item->count = $ingridient['count'];
            RecipeIngrigient::create($item->attributesToArray());
        }

        return redirect()->route('recipes.index')
            ->with('success','Recipe created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function show(Recipe $recipe)
    {
        return view('recipes.show',compact('recipe'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function edit(Recipe $recipe)
    {
        return view('recipes.edit',compact('recipe'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Recipe $recipe)
    {
        $this->validate($request, [
            'name' => 'required'
        ]);;

        $recipe->update($request->all());
        foreach ($request['ingridient'] as $ingridient){
            $item->recipe_id = $recipe->id;
            $item->ingridient_id = $ingridient['ingridient_id'];
            $item->count = $ingridient['count'];
            RecipeIngrigient::update($item->attributesToArray());
        }
        return redirect()->route('recipes.index')
            ->with('success','Recipe updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Recipe  $recipe
     * @return \Illuminate\Http\Response
     */
    public function destroy(Recipe $recipe)
    {
        $recipe->delete();

        return redirect()->route('recipes.index')
            ->with('success','Recipe deleted successfully');
    }

    public function createIngridient(Request $request){
        $ingridient = Ingridient::create($request->all());
        if($ingridient){
            $result['ingridient_id'] = $ingridient->id;
            $result['name'] = $ingridient->name;
            return response($result);
        }
    }
}
